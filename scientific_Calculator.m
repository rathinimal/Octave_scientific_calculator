function scientific_Calculator

  % Create a new figure window
  f = figure('Name', 'Scientific Calculator', 'NumberTitle', 'off', ...
             'MenuBar', 'none', 'Position', [300, 300, 400, 600]);

  % Create a text box for displaying input and results
  result_box = uicontrol('Style', 'edit', 'HorizontalAlignment', 'right', ...
                         'FontSize', 14, 'Position', [20, 530, 360, 40]);

  % Buttons and their labels
  buttons = { 'sin', 'cos', 'tan','log10', 'pi';
              '7', '8', '9', '.', 'C';
             '4', '5', '6', '*', '/';
             '1', '2', '3', '+', '-';
             '0', '.', '10', '%', 'sqrt';
             '(', ')', '^', '=', 'C'};

  % Callback function for buttons
  function button_callback(src, ~)
    current_text = get(result_box, 'String');
    button_label = get(src, 'String');
    if strcmp(button_label, 'C')
      set(result_box, 'String', ''); % Clear the input
    elseif strcmp(button_label, '=')
      try
        % Evaluate the mathematical expression
        result = eval(current_text);
        set(result_box, 'String', num2str(result));
      catch
        set(result_box, 'String', 'Error');
      end
    else
      % Append the button label to the current input
      set(result_box, 'String', [current_text, button_label]);
    end
  end

  % Create buttons
  for i = 1:6
    for j = 1:5
      uicontrol('Style', 'pushbutton', 'String', buttons{i, j}, ...
                'FontSize', 12, 'Position', [20 + (j - 1) * 75, ...
                500 - i * 75, 70, 70], ...
                'BackgroundColor', [0, 0, 1], ... % Light green color
                'Callback', @button_callback);
    end
  end
end

% Run the calculator
scientific_Calculator;

